# eb-safe-ssh

If your EB deployment policy is something like "Rolling with additional batch", you may experience "REMOTE HOST IDENTIFICATION HAS CHANGED!" warning while SSHing into the server after several times of deployment.

It is troublesome to remove host key and re-SSH every time after the deployment, and this tiny script comes to the rescue!

## Installation

1. Download the eb-safe-ssh.sh file.
2. Put it into a directory in `PATH`, e.g., `/usr/local/bin`, and file extension can be omitted.
    ```
    mv eb-safe-ssh.sh /usr/local/bin/eb-safe-ssh
    ```

## Usage

```
eb-safe-ssh <your-eb-environment-name>
```


## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/alanyeh20001/eb-safe-ssh.

## License
The gem is available as open source under the terms of the [MIT License](MIT License).
