


import os


def caculate(angle):

    #generate mash
    generate_mash="./murtazo/cloudnaca/runme.sh"+" "+str(angle)+" "+str(angle)+" 1"+" 200 3"
    os.system(generate_mash)

    #convert mash file
    mashfile='./murtazo/cloudnaca/msh/r3a'+str(angle)+'n200.msh'
    xmlfile='./murtazo/cloudnaca/msh/r3a'+str(angle)+'n200.xml'

    generate_xml='dolfin-convert '+mashfile+' '+xmlfile
    os.system(generate_xml)

    #run airfoil
    run_airfoil='./murtazo/navier_stokes_solver/airfoil 10 0.0001 10. 1 '+xmlfile
    os.system(run_airfoil)

    return 'ok'

example1=caculate(12)
print(example1)