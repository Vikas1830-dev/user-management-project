![User Management Project Banner](banner.png)


# 🛠️ User Management & Backup Script  

A **Bash script** to manage Linux users and create automatic backups of the `/home` directory — designed for simplicity and automation.

---

## 🎯 Features  

- ✅ **Add new users** with password setup  
- ✅ **Delete users** and their home directories  
- ✅ **List all system users**  
- ✅ **Create backups** of `/home`  
- ✅ **Automatic cleanup** — keeps only the latest 5 backups  

---

## 🛠️ Prerequisites  

Make sure your system is ready:  

- 🐧 **Linux system** (Ubuntu, CentOS, Amazon Linux, etc.)  
- 🛠️ **Bash shell**  
- 🔒 **Sudo/root access**  

---

## 💻 Installation  

1️⃣ **Clone this repository:**  
```bash
git clone https://github.com/Vikas1830-dev/user-management-project.git


2️⃣ Move into the project directory:
cd user-management-project

3️⃣ Give the script execution permissions:
chmod +x user_management.sh

4️⃣ Run the script:
sudo ./user_management.sh


🚀 How to Use

After running the script, you’ll see a menu like this:

===============================
 User Management & Backup Script
===============================
1. Add User
2. Delete User
3. List Users
4. Create Backup
5. Exit
===============================
Enter your choice:


🎯 1. Add User
Enter a username when prompted.
Set a secure password.

✅ User will be created with a home directory.


❌ 2. Delete User
Enter the username to remove.
🗑️ Deletes the user and their home directory.

📜 3. List Users
📋 Displays a list of all users on the system.

🔒 4. Create Backup
🔥 Compresses /home into a .tar.gz file in /backup.
🚀 Automatically keeps only 5 recent backups (deletes older ones).

🛑 5. Exit
🛸 Exits the script.

📌 Example Output

===============================
 User Management & Backup Script
===============================
1. Add User
2. Delete User
3. List Users
4. Create Backup
5. Exit
===============================
Enter your choice: 1
Enter the username to add: Vikas
Changing password for user khg12345

New password: ********
Retype new password: ********

User 'devuser' added successfully.


🔧 Troubleshooting

⚠️ Permission Denied when creating backups:

Ensure the backup directory is writable:

sudo mkdir -p /backup
sudo chmod 777 /backup

⚠️ Invalid choice error:
Make sure you enter a number (1-5), not words.

⚠️ Git push error ("rejected" or "non-fast-forward"):
Pull the latest changes first:
git pull origin master --rebase
git push origin master

⭐ Show Your Support
If this project helped you, please star the repository on GitHub:

👉 GitHub Repo Link: https://github.com/Vikas1830-dev/user-management-project.git


🚀 Happy scripting!
