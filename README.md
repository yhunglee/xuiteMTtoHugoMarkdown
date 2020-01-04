## Converter/Transformer of Xuite blog to hugo static site

#### Purpose

- Convert `.mt` file of xuite blog to be compatible with HUGO static site generator format `.md` (markdown) through command line

&nbsp;

#### Usage

```sh
xuite_blog_to_hugo YOUR_XUITE_MT_FILENAME_WITH_FILEPATH
```

&nbsp;

#### Notice

1. **ONLY EXECUTE CONVERTION THROUGH COMMAND LINE**
2. Cannot convert tag of xuite blog
3. Cannot 100% convert `html` to `markdown-compatible` format
4. Generate `.md` file name(s) starting from `0`
5. Automatically create folder `output` in current execution directory if `output` folder doesn't exist

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
