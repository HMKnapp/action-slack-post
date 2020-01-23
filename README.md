## Github Action Post to Slack

```
- name: Post to Slack
  uses: hkp-wcd/action-slack-post@master
    with:
      SLACK_TOKEN: ${{ secrets.SLACK_TOKEN }}
      JSON_PATH: 'slack_message.json'
```