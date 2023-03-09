# pushing-heavy-files

Go to [git-lfs](https://git-lfs.com/)

Find the type of file you want to ignore. Eg.: `file.h5`

```bash
git lfs install
git lfs track "*.h5"
git add .gitattributes
```

Now, commit and push as usual:

```bash
git add file.h5
git commit -m "uploading"
git push origin main
```
