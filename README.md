# Handson-L10-Spark-Streaming-MachineLearning-MLlib
Complered the code, but unable to get the tasks to run. Things I have attempted:
- Installed Python 3.10 and created a virtual environment
- Installed PySpark 3.5.1 to avoid `getSubject()` errors
- Switched to Java 17
- Removed Spark 4.x from `PATH`
- Rebuilt environment multiple times
- Attempted to run in GitHub Codespaces
- Attempted to retrain model after removing old artifacts
- Running in Docker

Several of the issues mentioned by CoPilot include:
- Spark 4.1.1 being incompatible with Windows
- Hadoop native I/O (`NativeIO$Windows.access0`) not being supported on Windows
- Model saving/loading failing due to Hadoop filesystem limitations
- Codespaces not supporting Spark 4.x
- PySpark 4.x requiring Python < 3.12
- Spark 4.x requiring Java 17, but still failing due to Hadoop
- Spark MLlib model saving being incompatible with Windows filesystem

- `models` folder was created, but no output