# node-at

node-at is a job scheduler performing like Linux's 'at' command. Jobs set by this scheduler will be executed only once unlike cron. This module uses `setTimeout` function in it.

# Usage

```javascript
var at = require('at');
at.schedule('8:20', function(data) {
    // do everything you want here!
});
```

If current time is past '8:20', the job scheduled with above code will be excuted at the time on the next day.

This module supports only "HH:mm" syntax yet.

I will support "YY/MM/DD HH:mm", "YY.MM.DD HH:mm", "YYMMDD HH:mm" and "HH:mm +2days" syntax in the near future.