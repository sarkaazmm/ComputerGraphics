- 👋 Hi, I’m @sarkaazmm
- 👀 I’m interested in ...
- 🌱 I’m currently learning ...
- 💞️ I’m looking to collaborate on ...
- 📫 How to reach me ...

<!---
sarkaazmm/sarkaazmm is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->

    bool operator<(const TypeName& other) {
        return name < other.name;
    }

    friend istream& operator>>(istream& is, TypeName& other) {
        is >> ...; return is;
    }
    friend ostream& operator<<(ostream& os, const TypeName& other) {
        os <<...<<endl; return os;
    }
