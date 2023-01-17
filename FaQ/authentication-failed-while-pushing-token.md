# Authentication failed while pushing - I need a token

## Error

- So you forked, cloned, worked on your lab and tried to push your changes.
- You get asked to input your username and password.
- You input your github username and your github password
- You get an authentication error

```bash
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/REPO’
```

## Troubleshooting
That's because you need to use a token instead of your password. Here's the steps:

1️⃣ Go to github
2️⃣ Go to your profile > settings
3️⃣ Scroll down to developer settings
4️⃣ Generate new token (classic)
5️⃣ Make sure the first box is checked
6️⃣ Scroll down and generate new token
7️⃣ Copy your new token somewhere on your computer
8️⃣ Repeat the pushing process: use your github user and then paste your token into terminal
9️⃣ Everything should push normally 🙂