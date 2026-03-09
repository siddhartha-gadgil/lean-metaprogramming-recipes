# Lean 4 (Meta)programming Cookbook Guidelines

Welcome to the Lean 4 (Meta)programming Cookbook. We appreciate you taking out time and reading through this document, to help everyone code better with Lean4. This document outlines how you should contribute to the cookbook.

Since we contain both programming and metaprogramming recipes, we name the repository "metaprogramming-recipes" to avoid confusion. This is meant to be inclusive of both types of recipes. We use "recipe" to refer to individual entries that solve specific problems, and "chapter" to refer to a collection of related recipes.

## Structure

The cookbook is organized into a hierarchy of chapters and recipes:

- **Main Entry**: `Cookbook.lean` is the front page.
- **Chapter Aggregator**: `Cookbook/Chapters.lean` manages the list of all chapters and the index.
- **Chapter Parent Files**: Located in `Cookbook/` (e.g., `Syntax.lean`, `Expressions.lean`). These define the chapter title and include individual recipes.
- **Recipes**: Individual Lean files located in subdirectories (e.g., `Cookbook/Syntax/Commands.lean`).

## Writing a New Recipe

Writing a new recipe is straightforward. Follow these steps to ensure your contribution is consistent with the existing content:

1. **Consult**: Make sure what you are writing is not already covered and is worth covering or not since we not particularly trying to duplicate other resources unless required. Please consult in discussions before starting.

2. **Create a New File**: Add a `.lean` file in the appropriate subdirectory: `Cookbook/{CHAPTER_NAME}/{RecipeName}.lean`. You may add a new chapter if needed. Please read the Section on Naming Conventions below before naming your file.

3. **Import Common Modules**: Start your file with the below imports:

```lean
import VersoManual
import Cookbook.Lean

open Verso.Genre Manual
open Verso.Genre.Manual.InlineLean

open Lean Elab Meta Tactic Command
open Cookbook

set_option pp.rawOnError true
```

4. **Define the Document**: Use `#doc (Manual) "Your Recipe Title" =>` to start. This should be different from file name and this will be visible on the Website for the recipe. The file name should be more technical and simpler, while the title can be more descriptive and user-friendly.

5. **Use Sections**: Use `#` for top-level headers within your recipe and `##` for sub-sections.

6. **Link to Chapter**: Add your file to the chapter's parent file to ensure it appears in the chapter and is indexed properly:
   - Open the chapter's parent file (e.g., `Cookbook/{CHAPTER_NAME}.lean`).
   - Add `import Cookbook.{CHAPTER_NAME}.{RecipeName}` at the top.
   - Include it using `{include 1 Cookbook.{CHAPTER_NAME}.{RecipeName}}`. If you think the recipe should come before other recipes, add it before the existing ones properly, otherwise add it at the end.

Please go through the [Example.lean](./Cookbook/Example.lean) recipe for a template to follow.

## Naming Conventions for Chapters, Files and Titles

1. **Chapters**: Use concise broad umbrella terms for chapter names (e.g., `Syntax`, `Widgets`, `Tactics`, etc.) that can encompass multiple related recipes. Avoid overly specific chapter names that only fit one recipe. You can have another submodule inside a chapter if you think it is necessary to group some recipes together but inside a chapter.

2. **Files**: Use concise and technical names for recipe files that reflect the specific problem being solved, but not too verbose. See existing recipes for examples.
   - Avoid using the same name as the chapter to prevent confusion.
   - Use CamelCase for file names (e.g., `readingFromFile.lean` instead of `reading_from_file.lean`).
   - Do not use symbols or numbers in file names. Use words to describe them (e.g., `And` instead of `&`, `Zero` instead of `0`, etc.).
   - The file name should be meaningful based on the recipe content. AVoid using generic names or adjectives, like `anEasyMacro.lean`, `aUsefulTactic.lean`, etc. If you think the recipe is easy or useful, you can index it accordingly or you can mention about that in the description, which the Verso Search will pick up for finding your recipe.

> Certain Exceptions to the above rules exist like a basic `helloWorldTactic.lean` recipe can be named to get started. If you would like, please use this as a getting started recipe in a new chapter. You can subinclude multiple recipes in the same file to give basic codes for getting started with a topic.

3. **Titles**: Use descriptive and user-friendly titles for the recipe that can be easily understood by readers. The title should give a clear idea of what the recipe is about without being too technical.

## Best Practices

- **Atomic Examples**: Keep each recipe focused on one specific problem.
- **Indexing**: Add index entries for key concepts: `{index}[My Concept]`.
- **Explain the "Why"**: Don't just show code; explain the approach and mention any "Pro-tips", but avoid excessive conceptual explanations unless necessary, by this we mean that refer any other official documentation/books for conceptual explanations, but if no other resources exist, then you can add a brief conceptual explanation but it should be concise and to the point.
- **Cross-Reference**: Link to related recipes using `{ref "tag"}[text]` and text sources like TPIL, FPIL, other Official Lean docs, etc. for conceptual explanations if needed.
- **Run Locally**: Always build your changes locally:

```bash
lake build lean-cookbook
lake exe lean-cookbook
```

- No AI Slop. Please write the content yourself. Since this is meant for you to write code easily, the more AI Slop there is with complicated jargon and less precise explanations, the less useful it will be. If you need help, ask in discussions or reach out on discusssions.

## Building and Previewing

The output will be in `_out/html-multi`. You can serve it locally using any static file server (e.g., `python3 -m http.server -d _out/html-multi`).

## Troubleshooting "INTERNAL PANIC"

If `lake exe` panics with `executed 'sorry'`:

1. Check your `+error` blocks. Ensure the error message matches the Lean output **perfectly**.
2. Ensure every `+error` block has a `(name := ...)` argument.
3. If all else fails, remove the `+error` or `leanOutput` and use a standard code block until the mismatch is found.
