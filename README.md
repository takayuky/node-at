# node-at

node-at is a job scheduler performing like Linux's 'at' command. Jobs set by this scheduler will be executed only once unlike cron. This module uses `setTimeout` function in it.

# install
```
npm install node-at
```

# Usage

```javascript
var at = require('at');
// if it's past a.m.8:20 already, this job will be executed tomorrow.
// if not, this job will be executed today.
at.schedule('08:20', function(data) {
    // do everything you want here!
});

// only future date is accepted.
at.schedule('2015-04-01 08:20', function(data) {
    // do everything you want here!
});
```

This module supports "HH:mm" format, aside from "YYYY-MM-DD HH:mm", "YYYY/MM/DD HH:mm", "YYYY.MM.DD HH:mm".

I will support "HH:mm +2days" format in the near future.