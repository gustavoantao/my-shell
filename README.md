# My-Shell

Sometimes you need to run some commands from inside your Kubernetes cluster but, you remember most of your running pods doesn't have shell...
And you'll need to run some commands not available in small images.
So lets use a simple custom image with some pre-installed tools.
It uses Ubuntu as base image and have the following

 - curl
 - netcat
 - net-tools
 - mariadb-client
 - postgresql-client
 - vim
 - ansible
 - nginx (it's just a workaround to keep the pod running when you need to run multiple steps inside and outside the pod, like pushing or pulling files using `kubectl cp`)

 You can use it by running:

 ```
 kubectl run my-shell -ti --rm --image gustavoantao/my-shell -- bash
 ```
 Or you can push your own image to Docker Hub or another registry and use it.
 Once you leave your shell session the pod will be automatically terminated (`--rm` option on kubectl command)

 If you need to keep the pod running use:

 ```
kubectl run my-shell -ti --image gustavoantao/my-shell -- bash

 ```
 When you leave the shell the pod will keep running in the cluster until you kill it with `kubectl delete pod my-shell`

 Copy files from your local to the pod:

 ```
 kubectl cp ./my-awesome-file.awe my-shell:/my-awesome-file.awe
 ```

 Copy files from your pod to your local:

 ```
 kubectl cp my-shell:/my-awesome-file.awe ./my-awesome-file.awe
 ```

Get into the running pod:

```
kubectl attach my-shell -c my-shell -ti
```

 Enjoy! ;-)