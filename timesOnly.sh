# Filter Gradle output for test class times only
STATS_DIR="gradle_test_stats"
for statsFile in $STATS_DIR/*.txt ; do
    timesFile="${statsFile%txt}times"
    grep -E "^>>> Test class" $statsFile | cut -d"	" -f2 | sort -n > "$timesFile"
done
