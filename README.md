# reminder-action

Allows to run GitHub Action schedule in odd or even weeks

```
name: Example reminder
on:
 schedule:
   - cron: '* */12 */15 * *'
 workflow_dispatch:
jobs:
  reminder:
    runs-on: ubuntu-latest
    env:
      VALID_WEEK_TYPE: odd
    steps:
      - name: Evaluate week type
        uses: ePages-de/reminder-action@master
        id: week_filter
      - name: Conditional step
        if: ${{ steps.week_filter.outputs.should_skip }} == 0
        run: echo This was allowed to run.
```

This job sends regular Mattermost notifications, based on the cron schedule.
The syntax for the cron schedule uses the syntax which you might already know
from the Unix cron jobs. The following links might be useful to craft the schedule:
- https://crontab-generator.org
- https://crontab.guru

Also see https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows
