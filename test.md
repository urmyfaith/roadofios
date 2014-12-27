# Welcome to Marxico

@(Sample notebook)[Marxico|Manual|Markdown]

**Marxico** is a delicate Markdown editor for Evernote. With reliable storage and sync powered by Evernote, **Marxico** offers greate writing experience. 

- **Versatile** - supporting code highlight & *LaTex*, inserting images by all means.
- **Exquisite** -  neat but powerful editor, featuring offline docs, shortcuts, live preview
- **Sophisticated** - deeply integrated with Evernote, supporting notebook & tags, two-way bind editing.   

> Get the free offline [Chrome App](https://chrome.google.com/webstore/detail/%E9%A9%AC%E5%85%8B%E9%A3%9E%E8%B1%A1/kidnkfckhbdkfgbicccmdggmpgogehop/reviews?hl=en&nonadv=5), as good as a native client!

----------

### Introducing Markdown

> Markdown is a plain text formatting syntax designed to be converted to HTML. Markdown is popularly used as format for readme files, ... or in text editors for the quick creation of rich text documents.  - [Wikipedia](http://en.wikipedia.org/wiki/Markdown)

As showed in this manual, it uses hash(#) to identify headings, emphasizes some text to be **bold** or *italic*. Serveral advanced syntax are listed below, please press `Cmd + /` to view Markdown cheatsheet.

#### Code block
``` python
@requires_authorization
def somefunc(param1='', param2=0):
    '''A docstring'''
    if param1 > param2: # interesting
        print 'Greater'
    return (param2 - param1 + 1) or None
class SomeClass:
    pass
>>> message = '''interpreter
... prompt'''
```

#### LaTex expression
$$	x = \dfrac{-b \pm \sqrt{b^2 - 4ac}}{2a} $$

#### Table
| Item      |    Value | Qty  |
| :-------- | --------:| :--: |
| Computer  | 1600 USD |  5   |
| Phone     |   12 USD |  12  |
| Pipe      |    1 USD | 234  |

### Dancing with Evernote

#### Notebook & Tags
**Marxico** add `@(Notebook)[tag1|tag2|tag3]` syntax to select notebook and set tags for the note. After typing `@(`, the notebook list would appear, please select one from it.  

#### Title
**Marxico** would adopt the first heading encountered as the note title. For example, in this manual the first line `Welcome to Marxico` is the title.

#### Quick Editing
Note saved by **Marxico** in Evernote would have a red ribbon button on the top-right corner. Click it and it would bring you back to **Marxico** to edit the note. 

> **Note:** Currently **Marxico** is unable to detect and merge any modifications in Evernote by user. Please do back to **Marxico** to edit.

#### Data Synchronization
While saving rich HTML content in Evernote, **Marxico** puts the Markdown text in a hidden area of the note, which makes it possible to get the original text in **Marxico** and edit it again. This is a really brilliant design because:
- it is beyond just one-way exporting HTML which other services do;
- and it avoids privacy and security problems caused by storing content in a intermediate server. 

> **Privacy Statement: All of your notes data are saved in Evernote. Marxico doesn't save any of them.** 

#### Offline Storage
**Marxico** stores your unsynchronized content locally in browser storage, so no worries about network and broswer crash. It also keeps the recent file list you've edited in `Document Management(Cmd + O)`.

> **Note:** Opthough browser storage is reliable in the most time, Evernote is born to do that. So please sync the document regularly while writing.

### Shortcuts
Help    `Cmd + /`
Sync Doc    `Cmd + S`
Create Doc    `Cmd + Opt + N`
Maximize Editor    `Cmd + Enter`
Doc Management    `Cmd + O`
Menu    `Cmd + M`

Delete Line    `Cmd + D`

Bold    `Cmd + B`
Insert Image    `Cmd + G`
Insert Link    `Cmd + L`
Convert Heading    `Cmd + H`

### Feedback & Bug Report
- Twitter: [@gock2](https://twitter.com/gock2)
- Email: <hustgock@gmail.com>

----------
Thank you for reading this manual. Now Please press `Cmd + M` and click `Link with Evernote`. Enjoy your **Marxico** journey!

