# Google Analytics

- [analytics.js](https://developers.google.com/analytics/devguides/collection/analyticsjs)
    - [Analytics.js Field Reference](https://developers.google.com/analytics/devguides/collection/analyticsjs/field-reference)

Примеры кода:

```js
ga(function() {
  // Logs an array of all tracker objects.
  console.log(ga.getAll());
});

ga(function () {
    tracker = ga.getAll()[0];
    console.log(tracker.b.data.keys);
});

ga.getAll()[0].get('name')
```
