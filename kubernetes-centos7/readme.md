[node master]
Khởi tạo Cluster

# Ssh vao may master
1. Gõ lệnh sau để khở tạo là nút master của Cluster: 
```
kubeadm init --apiserver-advertise-address=172.16.10.100 --pod-network-cidr=192.168.0.0/16

```
- note: https://kubernetes.io/docs/concepts/cluster-administration/addons/ o dự định dùng Addon calico nên chọn --pod-network-cidr=192.168.0.0/16

2. Execute the following commands to configure kubectl (also returned by kubeadm init)

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
3. Install Calico with the following command.

```
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```

4. Kiem tra 
   
    - kubectl cluster-info
    - kubectl get node

# Kết nối Node vào Cluster

1.  SSH ssh root@172.16.10.100

```
kubeadm token create --print-join-command
```

2. Nó cho nội dung lệnh kubeadm join ... thực hiện lệnh này trên các node worker thì node worker sẽ nối vào Cluster

3. Kiem tra
```
kubectl cluter-info
```



# Xem nội dung cấu hình hiện tại của kubectl
kubectl config view
# Lay config tu may master
```
scp root@172.16.10.100:/etc/kubernetes/admin.conf ~/.kube/config-mycluster
```

# Thiết lập file cấu hình kubectl sử dụng cho 1 phiên làm việc hiện tại của termianl
```
export KUBECONFIG=/Users/gianglh/.kube/config-mycluster
```

# Gộp file cấu hình kubectl
```
export KUBECONFIG=~/.kube/config:~/.kube/config-mycluster
kubectl config view --flatten > ~/.kube/config_temp
mv ~/.kube/config_temp ~/.kube/config
```

# Các ngữ cảnh hiện có trong config
kubectl config get-contexts

# Đổi ngữ cảnh làm việc (kết nối đến cluster nào)
kubectl config use-context kubernetes-admin@kubernetes












Sau khi lệnh chạy xong, chạy tiếp cụm lệnh nó yêu cầu chạy sau khi khởi tạo- để chép file cấu hình đảm bảo trình kubectl trên máy này kết nối Cluster

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
Tiếp đó, nó yêu cầu cài đặt một Plugin mạng trong các Plugin tại addon, ở đây đã chọn calico, nên chạy lệnh sau để cài nó
  `kubectl apply -f https://docs.projectcalico.org/v3.10/manifests/calico.yaml`
Gõ vài lệnh sau để kiểm tra

`
# Thông tin cluster
kubectl cluster-info
# Các node trong cluster
kubectl get nodes
# Các pod đang chạy trong tất cả các namespace
kubectl get pods -A
`

Cài đặt các node worker - kubernetes
Kết nối Node vào Cluster

Hãy vào máy node **master** (bằng SSH ssh root@172.16.10.100). Thực hiện lệnh sau với Cluster để lấy lệnh kết nối
`kubeadm token create --print-join-command`

