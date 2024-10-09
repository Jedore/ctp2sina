# ctp2sina

**���زο� https://github.com/openctp/openctp/tree/master/ctp2Sina**

## ׼��

- Window 10
    - VS 2022
    - Boost 1.78
- Debian 12

## Win 10 ��װ Boost 1.78

1. ����

   1.78 ��ǰ�İ汾 ò�Ʋ�֧�� VS2022

   https://archives.boost.io/release/1.78.0/source/boost_1_78_0.zip

   ��ѹ�� D:\boost_1_78_0

2. ����

    ```bash 
    # powershell ���� boost ��ѹĿ¼ D:\boost_1_78_0
    # ���� bootstrap.bat ���� b2.exe
    .\bootstrap.bat
   
    # ���� b2.exe ���� stage\lib
    .\b2.exe toolset=msvc-14.3 link=static runtime-link=static
    ```

## Win ��������

```bash
# ����vs2022��Ŀ
# 32λ
cmake -S . -B build -G "Visual Studio 17 2022" -A Win32
# 64λ
cmake -S . -B build -G "Visual Studio 17 2022" -A x64

# �������ɿ��ļ�
cmake --build build --config Release --clean-first
```
