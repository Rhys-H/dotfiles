import pdb

class Config(pdb.DefaultConfig):
    sticky_by_default = True
    use_terminal256formatter = False

    def setup(self, pdb):
        print("Use 'emb' to enter IPython shell")
