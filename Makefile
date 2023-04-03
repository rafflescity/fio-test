build:
	docker build . -t fio

push:
	docker tag fio-test daocloud.io/piraeus/fio
	docker push daocloud.io/piraeus/fio

run:
	kubectl create configmap fio-test --from-file=fio-test.sh
	kubectl apply -f pvc.yaml
	kubectl apply -f job.yaml

unrun:
	kubectl delete -f job.yaml || true 
	kubectl delete -f pvc.yaml || true 
	kubectl delete configmap fio-test || true

rerun: unrun run

