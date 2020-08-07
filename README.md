## AWS CDK Dockerized

This is dockerised version of the aws cdk, which means you can run the tool without directly installing on your system. It's also super useful for CI/CD pipelines like gitlab ci where you want o automate the deployment of your stack once commited to git.

Its available for X86_64, ARM will be coming soon

## Downloading

```
docker pull richarvey/awscdk:latest
```

See all tags at [https://hub.docker.com/r/richarvey/awscdk/tags/](https://hub.docker.com/r/richarvey/awscdk/tags/)

## Running the toolkit in normal mode
Running in the normal mode gives CDK access to your current working directory and your AWS credentials (potentially ~/.aws). Its controlled by specifying _-v \`pwd\`:/app -v ~/.aws:/root/.aws_ on the command line. This will be the mode used in all the examples. This is great for limiting the reach of the toolkit onto your system. You'll share your AWS credentials and the current working directory so you CDK can access user filess.

_NOTE:_ I recommend running these as bash alias' in order to make its a smooth process of using this toolkit.

#### Using the cli

Run the container and map a local directory (for files you may want to use) and .aws config for credentials

```
docker run -it -v `pwd`:/app -v ~/.aws:/root/.aws richarvey/awscdk:latest ${COMMAND}
```

## Adding to .bash_profile for :latest

You can set an alias and then use awscdk as normal from your shell if desired, this makes it super easy to access.

```
vi ~/.bash_profile
```

```
cdk() {
  docker run -it -v `pwd`:/app -v ~/.aws:/root/.aws --rm richarvey/awscdk:latest "$@";
}
```

## Building yourself

```
docker build -t MYBUILD .
``` 

_NOTE:_ __./build.sh__ uses dockers buildx to build amd64 and aarch64 and push to my repo so you'll need to tweak it for your username

## TODO

- Use none root user
- Decide if we support dind for conatiner artifacts
- templates for gitlab ci
