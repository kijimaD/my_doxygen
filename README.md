# Doxygen sample

```shell
docker build . -t test
docker run --rm -v $(pwd):/work --workdir /work test sh -c "doxygen ."
```
