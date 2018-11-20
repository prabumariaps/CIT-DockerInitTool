import docker
import logging as lg

client = docker.DockerClient(base_url='unix://var/run/docker.sock')




def buildImage(dockerfile="", imageName="", buildargs="", fileShellname="setup.sh"):
    try:
        (image, logs) = client.images.build(path="src", dockerfile=dockerfile, tag=imageName,
                                            buildargs=buildargs, network_mode="host", rm=True)
        lg.info(logs)
        print(vars(logs))
        # lg.info(image.tags)
    except Exception as e:
        lg.error(e)

    print("------------| List Image |-------------")
    listimage = client.images.list()
    for image in listimage:
        print(vars(image))


buildImage(dockerfile="Dockerfile", imageName="javaimage")

client.close()
