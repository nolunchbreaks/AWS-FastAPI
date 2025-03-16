# 🚀 Flask App Deployment on AWS Fargate with Terraform  

This project showcases a full-cycle deployment of a **Flask web application**, built from scratch, containerized with **Docker**, and deployed on **AWS Fargate** using **Terraform** for Infrastructure as Code (IaC).

---

## 🛠️ Tech Stack  

- **Flask** - Web framework for Python  
- **Docker** - Containerization for portability  
- **AWS Fargate** - Serverless container orchestration  
- **ECS & ECR** - Managed container services  
- **Terraform** - Infrastructure as Code for automation  
- **VPC, Subnets, Security Groups** - Networking setup  
- **IAM Roles & Policies** - Secure AWS access control  

---

## 🚀 Features  

- 🏗️ **Built Flask app from scratch** (custom routes, API logic)  
- 🐳 **Containerized the app** with Docker for easy deployment  
- 📦 **Pushed image to Amazon ECR** (Elastic Container Registry)  
- ☁️ **Deployed to AWS Fargate** via ECS (fully managed serverless compute)  
- 🌐 **Configured Networking** (VPC, subnets, security groups, IAM roles)  
- 🔍 **Troubleshot IAM & security group issues** to allow public access  
- 💥 **Destroyed all resources** after testing to ensure cost efficiency  

---

## 📦 Setup & Deployment  

### 1️⃣ Clone the Repository  

```sh
git clone https://github.com/yourusername/your-repo.git
cd your-repo
```

### 2️⃣ Set Up Virtual Environment  

```sh
python -m venv venv
source venv/bin/activate  # Mac/Linux
venv\Scripts\activate     # Windows
```

### 3️⃣ Install Dependencies  

```sh
pip install -r requirements.txt
```

### 4️⃣ Run the Flask App Locally  

```sh
python app.py
```

---

## 🏋️‍♂️ Dockerization & Deployment  

### 1️⃣ Build & Tag Docker Image  

```sh
docker build -t flask-app .
```

### 2️⃣ Authenticate & Push to ECR  

```sh
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com
docker tag flask-app:latest <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest
docker push <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest
```

### 3️⃣ Deploy with Terraform  

```sh
terraform init
terraform apply -auto-approve
```

---

## ⚡ Destroying Resources  
After testing, you can destroy all resources to optimize costs and maintain a clean cloud environment.

```sh
terraform destroy -auto-approve
```

---

## 🤝 Contributing  
We welcome contributions! To get started:

### 1️⃣ Fork the repository  

### 2️⃣ Create a feature branch:  

```sh
git checkout -b feature-branch
```

### 3️⃣ Make your changes & commit:  

```sh
git commit -m "Added a new feature"
```

### 4️⃣ Push & submit a pull request:  

```sh
git push origin feature-branch
```

---

## 🏆 Credits  
Built with by Osagie Anolu  

💡 "Deploy fast, scale seamlessly."
![Screenshot (201)](https://github.com/user-attachments/assets/b2a26f2a-7f83-4ec2-a8fa-45e5331433d0)
![Screenshot (203)](https://github.com/user-attachments/assets/efef53e8-d98b-4bef-859f-237b9aa034b9)
