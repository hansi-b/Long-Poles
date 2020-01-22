JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

GRADLE_DIR="/opt/gradle"
if [ ! -d "$GRADLE_DIR" ] ; then
    ( >&2 "Gradle directory '$GRADLE_DIR' not found, aborting" )
    exit 1
fi

STATS_OUT_DIR="stats"
if [ ! -d "$STATS_OUT_DIR" ] ; then
    mkdir "$STATS_OUT_DIR"
fi

startTime=$(date +"%s")
outFile="$STATS_OUT_DIR/test_classes_$(date +"%Y%m%d%H%M").txt"

(cd $GRADLE_DIR ; ./gradlew test | grep -E "^>>> (Test class|Gradle Test Executor)" ) >"$outFile"

endTime=$(date +"%s")
echo "#DIFF $(($endTime-$startTime))" >> $outFile
