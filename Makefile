
NAME=cleaningwithcosta.com
IMAGE=eignhpants/${NAME}

run:
	npm start

build: npm-install

# browser-sync start --proxy "localhost:8888" --serveStatic 'public' --files 'public'


npm-install:
	npm install

client:
	stylus -u nib client/views/styles/style.styl -o server/public/dist/
	#browserify --debug client/iancullinane.com.js -t babelify -o server/public/dist/include.js

watch:
	stylus -w client/views/styles/style.styl -o server/public/dist/ &
	#watchify --debug client/iancullinane.com.js -t babelify -t pugify -o server/public/dist/include.js -v -v --poll=1000 &

clean:
	-rm -f public/dist/include.js
	-rm -f public/dist/syle.css

build-npm:
	browserify --debug -t jadeify views/ui.js -o public/js/include.js


sync:
	browser-sync start --proxy "localhost:3334" --serveStatic 'public' --files 'server/public/dist/style.css, client/views/'

.PHONY: run build client


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
