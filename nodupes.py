import sys, os, subprocess

myvar = sys.argv[1]
cfg = "00-nodupes.cfg"

from tinytag import TinyTag
tag: TinyTag = TinyTag.get(myvar)

#subprocess.run(["mkdir", "-p", tag.title])
#subprocess.run(["mkdir", "-p", cfg])
#os.chdir(cfg)
#subprocess.run(["mkdir", "-p", tag.title])

#f = open(idx, "w")
#subprocess.run(["echo", myvar], stdout=f)
#subprocess.run(["echo", myvar], stdout=f, cwd=tag.title)
#f.close()

#subprocess.run(["mv", idx, cfg/tag.title])

print(tag.title)
