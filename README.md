## Converter/Transformer of Xuite blog to hugo static site

#### Purpose

- Convert `.mt` file of xuite blog to be compatible with HUGO static site generator format `.md` (markdown)

&nbsp;

#### Notice

1. Cannot convert tag of xuite blog
2. Cannot 100% convert `html` to `markdown-compatible` format
3. Generate `.md` file name(s) starting from `0`
4. Auto create folder `output` in current execution directory if `output` folder doesn't exist

&nbsp;

#### Convertion

**From left to right**

&nbsp;

| xuite meta | hugo markdown meta |
| ---------- | ------------------ |
| TITLE:     | title:             |
| AUTHOR:    |                    |
| DATE:      | date:              |
| CATEGORY:  | categories:        |
|            | image:             |
|            | description:       |
| STATUS:    | draft:             |
|            | tags:              |
|            | type:              |
|            | highlight:         |

| xuite body | hugo markdown body   |
| ---------- | -------------------- |
| BODY:      | --- and two newlines |
