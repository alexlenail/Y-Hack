// Called when the user clicks on the browser action.
/*  chrome.browserAction.onClicked.addListener(function(tab) {
    chrome.tabs.create(url('http://www.google.com'));
  });*/

document.addEventListener('DOMContentLoaded', function() {
  chrome.tabs.create(url('http://www.google.com'));
});
