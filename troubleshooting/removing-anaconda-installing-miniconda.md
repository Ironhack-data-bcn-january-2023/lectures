# removing-anaconda-installing-miniconda

## Mini-conda & jupyter notebooks

1. Download miniconda [here](https://docs.conda.io/en/latest/miniconda.html)

```bash
# 2. Linking miniconda with your terminal

conda init zsh #mac
conda init bash #windows

# 3. Create environment
conda create -y -n ironhack
conda activate -y ironhack

# 4. Install jupyter notebooks
conda install -y -c anaconda jupyter

# 5. Installing kernel
conda install -y -c anaconda ipykernel
python -m ipykernel install --user --name=ironhack

# 6. Extensions
conda install -y -c conda-forge jupyter_contrib_nbextensions
```

- Kill and reopen terminal. Then:

```bash
# On one terminal window
conda activate ironhack
jupyter notebooks
```

```bash
# On a second new terminal window
conda activate ironhack
```
