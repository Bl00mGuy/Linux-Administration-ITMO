#!/bin/bash

echo "Launching Lab-2:"

for i in {1..30}
do
	echo "Executing task_$i..."
	bash "./scripts/task_$i.sh"
	if [ $? -ne 0 ]; then
		echo "[ERROR]: Executing of task_$i finished with error."
	else
		echo "[OK]: Finished executing task_$i."

	fi
done
