//! Rust syntax showcase: async, Result, closures, iterators, attributes, and tests.

use std::error::Error;
use std::fmt::{self, Display, Formatter};

type SampleResult<T> = Result<T, SampleError>;

#[derive(Debug)]
pub struct SampleError {
    message: String,
}

impl Display for SampleError {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.message)
    }
}

impl Error for SampleError {}

#[derive(Debug, Default)]
pub struct Report {
    pub title: String,
    pub values: Vec<i32>,
}

impl Report {
    pub async fn load(title: impl Into<String>) -> SampleResult<Self> {
        let title = title.into();
        if title.is_empty() {
            return Err(SampleError {
                message: "title cannot be empty".into(),
            });
        }

        Ok(Self {
            title,
            values: vec![1, 2, 3, 5, 8, 13],
        })
    }

    pub fn summarize(&self) -> i32 {
        self.values
            .iter()
            .copied()
            .filter(|value| value % 2 != 0)
            .map(|value| value * value)
            .sum()
    }
}

pub async fn run() -> SampleResult<()> {
    let report = Report::load("reef").await?;
    println!("{} -> {}", report.title, report.summarize());
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn summarize_odd_squares() {
        let report = Report {
            title: "test".into(),
            values: vec![1, 2, 3],
        };

        assert_eq!(report.summarize(), 10);
    }
}
