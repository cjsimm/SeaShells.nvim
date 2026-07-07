#!/usr/bin/env python3
"""Python syntax showcase: literals, classes, decorators, types, and control flow."""

from __future__ import annotations

import dataclasses
import functools
from collections.abc import Iterable, Iterator
from typing import Final, Generic, Protocol, TypeVar


MAX_RETRIES: Final[int] = 3
T = TypeVar("T")


class Renderable(Protocol):
    """Anything that can be rendered as text."""

    def render(self) -> str:
        ...


@dataclasses.dataclass(slots=True, frozen=True)
class Shell(Generic[T]):
    name: str
    value: T
    tags: tuple[str, ...] = ("sea", "shell")

    @property
    def label(self) -> str:
        return f"{self.name!s}: {self.value!r}"

    def render(self) -> str:
        return " | ".join((*self.tags, self.label))


def log_calls(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        print(f"calling {func.__name__}({args=}, {kwargs=})")
        return func(*args, **kwargs)

    return wrapper


@log_calls
def normalize(items: Iterable[str | None]) -> Iterator[str]:
    for item in items:
        match item:
            case None | "":
                continue
            case str() as text if text.startswith("#"):
                yield text.removeprefix("#").upper()
            case str() as text:
                yield text.strip().casefold()


def classify(score: float) -> str:
    if score >= 0.9:
        return "excellent"
    if 0.5 <= score < 0.9:
        return "steady"
    return "low"


def main() -> int:
    shell = Shell(name="conch", value={"size": 42, "rare": True})
    names = list(normalize(["#Pearl", None, " Coral "]))
    scores = {name: index / 10 for index, name in enumerate(names, start=7)}

    try:
        print(shell.render())
        for name, score in scores.items():
            print(name, classify(score))
    except RuntimeError as exc:
        raise SystemExit(f"render failed: {exc}") from exc
    finally:
        print("done")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
