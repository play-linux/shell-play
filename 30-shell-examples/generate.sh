#!/bin/bash
for i in {1..30};do
	echo -e "#!/bin/bash\n" > ${i}.sh && chmod +x ${i}.sh
done
