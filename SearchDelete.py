import os

# Path data
<<<<<<< HEAD
#pathOrg="./"
pathOrg="/home/sapp/convocatorias/archivos_estimulos/"
pathDes="./DeleteFiles/"
=======
pathOrg="/data/site_public/"
pathDes="./rmFiles/"
>>>>>>> b37a87da534ae19839ee16a2529f08ce7a94c603

"""
import numpy as np

File4rm = np.loadtxt("files.txt",  skiprows = 0,dtype=str,delimiter="|")

for file in File4rm:
    if os.path.exists(pathOrg+file):
        #os.remove(pathOrg+file)
        os.rename(pathOrg+file, pathDes+file)
    else:
        print("File dosen't exist")

"""

f = open("files.txt")     # This is a big file
File4rm=[]
for line in f:                # Using 'for ... in' on file object
    #print (line)                # ',' keeps print from adding a line break
    if len(line)>1:
        File4rm.append(line)    
f.close()

for file in File4rm:
    if os.path.exists(pathOrg+file):
        #os.remove(pathOrg+file)
        os.rename(pathOrg+file, pathDes+file)
        print("File dose exist")
    else:
        print("File dosen't exist")
