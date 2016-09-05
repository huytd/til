# Get focused element from blur event

You may not know there is a very useful object, it called `document.activeElement`, which will tell you what is the currently focused element on the web page.

And the good thing, it's available in all browser, even IE and Opera (See [MDN - document.activeElement](https://developer.mozilla.org/en-US/docs/Web/API/Document/activeElement)).

For the usage, let's say you want to know which element user is pointing to when he leave the textarea:

```js
textarea.on('blur', function() {
  setTimeout(function(){
    var focusedElement = document.activeElement;
  }, 1);
});
```

There is a `setTimeout` because we need to slow down a bit, so the DOM can be updated with the correct focused element.
