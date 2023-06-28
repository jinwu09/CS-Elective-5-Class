<?php

$msg = "tesst";
$test = function ($test) use (&$msg) {
    echo "<br>" . $test . $msg . "<br>";
};

function callfunction($anonymousFunction)
{
    if (!is_callable($anonymousFunction)) {
        echo "this is not callable";
    } else {
        $msg = "tesst";
        $anonymousFunction();

    }
}

$msg = "meow";
callfunction($test("meows"));