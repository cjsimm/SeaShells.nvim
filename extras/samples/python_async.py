"""Python syntax showcase: async, context managers, exceptions, and comprehensions."""

from __future__ import annotations

import asyncio
from contextlib import asynccontextmanager
from decimal import Decimal
from pathlib import Path


class SampleError(Exception):
    pass


@asynccontextmanager
async def open_session(name: str):
    print(f"open {name}")
    try:
        yield {"name": name, "active": True}
    finally:
        print(f"close {name}")


async def fetch_shell(index: int) -> dict[str, object]:
    await asyncio.sleep(0.01)
    if index < 0:
        raise SampleError("negative indexes are invalid")
    return {
        "id": index,
        "path": Path(f"/tmp/shell-{index}.txt"),
        "weight": Decimal("1.25") * index,
        "flags": {True, False, None},
    }


async def collect() -> list[dict[str, object]]:
    async with open_session("reef") as session:
        print(session["name"], session["active"])
        tasks = [fetch_shell(index) for index in range(1, 4)]
        return [result async for result in _as_completed(tasks)]


async def _as_completed(tasks):
    for future in asyncio.as_completed(tasks):
        try:
            yield await future
        except SampleError as exc:
            print(f"skipped: {exc}")


async def main() -> None:
    rows = await collect()
    summary = {
        row["id"]: row["weight"]
        for row in rows
        if isinstance(row["weight"], Decimal)
    }
    print(summary)


if __name__ == "__main__":
    asyncio.run(main())
