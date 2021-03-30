Capp healthchecker for prometheus
=================================

Any container running with [capp](https://github.com/jrd/capp) can be monitored, especialy its **healthcheck** status.

Only container that exhibits the following labels will be monitored:
- `capp.app`
- `capp.environment`

This application will create two prometheus status enum:
- `container_status_enum` will output the container running state
- `container_health_enum` will output the container healthcheck state

Those enums will have the following labels joined:
- `container_label_capp_app`
- `container_label_capp_environment`

Each enum will output the value `1.0` if it matches and `0.0` if not.

Status enum
-----------

- `created`
- `running`
- `paused`
- `restarting`
- `exited`
- `exited-crashed`
- `stopping`
- `dead`

Health enum
-----------

- `none`
- `healthy`
- `unhealthy`

Usage
-----

```sh
> DOCKER_BUILDKIT=1 docker build -t capp_healthchecker .
> docker run -d -v /var/run/docker.sock:/var/run/docker.sock:ro -p <local_port>:80 capp_healthchecker
```
