# pushing-heavy-files

If you already added the files, tried to push and it didn't work, start from scratch. On your local machine, on your repo:
```bash
 rm -rf .git
 git init 
 git remote add origin LINK_TO_YOUR_REPO
 ```
 
Note: make sure the branch is main when running git init. otherwise change the config so everygit init command will start on main instead of master.

Then, follow the steps below: 

1. Go to [git-lfs](https://git-lfs.com/) & install it on your system.

2. Find the type of file you want to ignore. Eg.: `file.h5`

```bash
git lfs install
git lfs track "*.h5"
git add .gitattributes
```

3. Now, commit and push as usual:

```bash
git add file.h5
git commit -m "uploading"
git push origin main
```
