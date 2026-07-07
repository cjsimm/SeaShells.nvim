//! Rust syntax showcase: modules, traits, generics, enums, matches, and macros.

use std::collections::HashMap;
use std::fmt::{self, Display, Formatter};

const THEME_NAME: &str = "SeaShells";
static DEFAULT_BG: &str = "#09141b";

#[derive(Debug, Clone, PartialEq)]
pub enum ShellKind {
    Conch,
    Scallop,
    Custom(String),
}

pub trait Render {
    fn render(&self) -> String;
}

#[derive(Debug, Clone)]
pub struct Shell<'a, T>
where
    T: Display,
{
    pub name: &'a str,
    pub kind: ShellKind,
    pub value: T,
}

impl<T> Render for Shell<'_, T>
where
    T: Display,
{
    fn render(&self) -> String {
        format!("{}::{:?} = {}", self.name, self.kind, self.value)
    }
}

impl<T: Display> Display for Shell<'_, T> {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.render())
    }
}

macro_rules! shell_map {
    ($($name:literal => $value:expr),+ $(,)?) => {{
        let mut map = HashMap::new();
        $(map.insert($name, $value);)+
        map
    }};
}

pub fn classify(score: Option<u8>) -> &'static str {
    match score {
        Some(90..=100) => "excellent",
        Some(50..=89) => "steady",
        Some(_) => "low",
        None => "unknown",
    }
}

fn main() {
    let shell = Shell {
        name: THEME_NAME,
        kind: ShellKind::Custom(String::from("theme")),
        value: DEFAULT_BG,
    };

    let scores = shell_map!("contrast" => 92, "warmth" => 76, "noise" => 12);

    for (name, score) in scores.iter().filter(|(_, score)| **score > 20) {
        println!("{name}: {} ({})", classify(Some(*score)), shell);
    }
}
