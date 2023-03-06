# HTTP Monitor
The code parses information from HTTP log records and produces statistics and alerts based on configurable parameters.

## Usage
To produce the statistics/alerts execute:
```text
httpmonitor-0.1 <monitor.properties>
```
where `monitor.properties` contains the values of the configuration parameters:
* `stats_interval_sec`: duration of interval (in **seconds**) over which traffic statistics are computed (default value 10sec).
* `alert_interval_sec`: duration of interval (in **seconds**) over which alert conditions are computed (default value 120sec).
* `alert_threshold_rps`: alert threshold (in **requests per second**) (default value 10.0rps).
* `data_file`: csv file with HTTP log records (default value sample.csv).

All the output is printed on the console. Error messages are printed on the stderr.


## Compilation
The code is developed using Java 13 and built using Maven 3.8.6.

To build the code run:
```text
$ ./build.sh
```
This creates `target/httpmonitor-0.1` which an executable wrapper script that executes the code in `target/httpmonitor-0.1.jar`.


## Internals - Performance - Scaling
The execution starts by reading the properties files and sets the values of the configuration parameters, using 
default values if some are not defined.

An iterator is created which scans the content of the input data file. This means the log data are read only once. 
In the current implementation the iterator scans the contents of the input file, but in general, an iterator can be
iterating over a stream of data. The main functionality of the code will not change in this case, as long as the 
iterator conforms to the Iterator interface.

