#!/bin/bash

java -jar ~/tool/AXMLPrinter2.jar AndroidManifest.xml > AndroidManifest_human_readable.xml
vi AndroidManifest_human_readable.xml
