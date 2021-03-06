@echo off

set API_PORT=8765
set UI_PORT=8764
set CONNECTORS_PORT=8984
set SOLR_PORT=8983
set SPARK_MASTER_PORT=8766
set SPARK_MASTER_UI_PORT=8767
set SPARK_WORKER_PORT=8769
set SPARK_WORKER_UI_PORT=8770

REM If you change this value, also change the clientPort in conf/zookeeper/zoo.cfg
set ZOOKEEPER_PORT=9983

set FUSION_ZK=localhost:9983
set FUSION_SOLR_ZK=localhost:9983
set "MAX_PERM=-XX:MaxPermSize=256m"
set "JETTY_HOME=%FUSION_HOME%\apps\jetty\home"
set "VAR_DIR=%FUSION_HOME%\var"
set STOP_KEY=fusion


REM The origins that are allowed to serve resources
set FUSION_CORS_ALLOW_ORIGIN=.*

REM Enable verbose GC logging
set GC_LOG_OPTS=-verbose:gc -XX:+PrintHeapAtGC -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+PrintTenuringDistribution -XX:+PrintGCApplicationStoppedTime -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=20 -XX:GCLogFileSize=10M
REM These GC settings have shown to work well for a number of common Solr workloads
set GC_TUNE=-XX:NewRatio=3 ^
 -XX:SurvivorRatio=4 ^
 -XX:TargetSurvivorRatio=90 ^
 -XX:MaxTenuringThreshold=8 ^
 -XX:+UseConcMarkSweepGC ^
 -XX:+UseParNewGC ^
 -XX:ConcGCThreads=4 -XX:ParallelGCThreads=4 ^
 -XX:+CMSScavengeBeforeRemark ^
 -XX:PretenureSizeThreshold=64m ^
 -XX:+UseCMSInitiatingOccupancyOnly ^
 -XX:CMSInitiatingOccupancyFraction=50 ^
 -XX:CMSMaxAbortablePrecleanTime=6000 ^
 -XX:+CMSParallelRemarkEnabled ^
 -XX:+ParallelRefProcEnabled

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
set "SCRIPT_DATETIME=!mydate!_!mytime!"

