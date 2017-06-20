
NAME=cleaningwithcosta.com
IMAGE=eignhpants/${NAME}

run:
	npm start

build: npm-install

# browser-sync start --proxy "localhost:8888" --serveStatic 'public' --files 'public'


npm-install:
	npm install

client:
	stylus -u nib views/styles/style.styl -o public/stylesheets/
	#browserify --debug app/iancullinane.com.js -t babelify -o public/dist/include.js

watch:
	stylus -u nib -w views/styles/style.styl -o public/dist/style.css &
	watchify --debug app/iancullinane.com.js -t babelify -t pugify -o public/dist/include.js -v -v --poll=1000 &

clean:
	-rm -f public/js/include.js
	-rm -f public/stylesheets/syle.css

build-npm:
	browserify --debug -t jadeify views/ui.js -o public/js/include.js

.PHONY: run build


#
# Docker targets
#

tag-docker:
	docker build -t ${IMAGE} .
	docker tag ${IMAGE}:latest ${IMAGE}:stable
	docker push ${IMAGE}:stable

build-docker:
	docker build -t ${NAME} .

run-docker: clean-docker
	docker run -d -u app\
		-p 3334:3334\
		-m "300M" --memory-swap "1G"\
		--name ${NAME} ${NAME}

clean-docker:
	-docker kill ${NAME}
	-docker rm ${NAME}

# dist-docker: clean
# 	#envsubst < ${CURDIR}/cost-dashboard-deployment/prod.config.py > ${CURDIR}/config.py
# 	docker build --no-cache -f Dockerfile.build -t build-container .
# 	docker run -v  "${CURDIR}/public/dist:/build/public/dist" build-container
