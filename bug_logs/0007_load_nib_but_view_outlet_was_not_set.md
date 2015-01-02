
## problem

```Objective-c
loaded the "..." nib but the view outlet was not set.'
```

"UIProjects/1224_week8_day3/1224_xib_basic/myIB.xib"

## solve

http://stackoverflow.com/questions/4763519/loaded-nib-but-the-view-outlet-was-not-set-new-to-interfacebuilder

- Open the XIB file causing problems
- Click on file's owner icon on the left bar (top one, looks like a yellow outlined box)
- If you don't see the right-hand sidebar, click on the third icon above "view" in your toolbar. This will show the right-hand sidebar
- In the right-hand sidebar, click on the third tab--the one that looks a bit like a newspaper
- **Under "Custom Class" at the top, make sure Class is the name of the ViewController that should correspond to this view. **If not, enter it
- In the right-hand sidebar, click on the last tab--the one that looks like a circle with an arrow in it
- You should see "outlets" with "view" under it. **Drag the circle next to it over to the "view" icon on the left bar (bottom one, looks like a white square with a thick gray outline
Save the xib and re-run**

