build:
	docker build . -t fio

push:
	docker tag fio-test daocloud.io/piraeus/fio
	docker push daocloud.io/piraeus/fio

run: unrun
	kubectl create configmap fio-test --from-file=fio-test.sh
	helm install fio-test ./charts \
		--set pvc.storageClass=$(SC)

unrun:
	helm uninstall fio-test || true
	kubectl delete configmap fio-test || true

