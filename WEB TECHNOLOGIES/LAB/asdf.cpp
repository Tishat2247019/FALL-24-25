#include <bits/stdc++.h>
using namespace std;

int main()
{
    int t;
    cin >> t;
    while (t--)
    {
        int n;
        cin >> n;
        int *v = new int[n];
        for (int i = 0; i < n; i++)
        {
            cin >> v[i];
        }
        for (int i = 0; i < n; i++)
        {
            cout << v[i];
        }

        vector<int> v[n];
        vector<int> v(n);
        for (auto &ptr : m)
        {
            cin >> ptr.first >> ptr.scond;
        }

        for (auto ptr : m)
        {
            cout << ptr.first << " " << ptr.second << endl;
        }
    }
}