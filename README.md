# ctp2sina

编译多个CTP版本以接入新浪行情（使用参考[openctp-ctp-channels](https://github.com/Jedore/openctp-ctp-channels)）

> 严重参考 https://github.com/openctp/openctp/blob/master/ctp2Sina

## 准备

- Window 10
    - VS 2022
    - Boost 1.78
- Debian 12
    - g++ 12.2.0

## Win 10 安装 Boost 1.78

1. 下载

   1.78 以前的版本 貌似不支持 VS2022

   https://archives.boost.io/release/1.78.0/source/boost_1_78_0.zip

   解压到 D:\boost_1_78_0

2. 编译

    ```bash 
    # powershell 进入 boost 解压目录 D:\boost_1_78_0
    # 运行 bootstrap.bat 生成 b2.exe
    .\bootstrap.bat
   
    # 运行 b2.exe 生成 stage\lib
    .\b2.exe toolset=msvc-14.3 link=static runtime-link=static
    ```

## Debian 12 安装 Boost 1.78

1. 下载

   保持和window一致，1.78

    ```bash
    wget https://archives.boost.io/release/1.78.0/source/boost_1_78_0.tar.gz
    tar -xzvf boost_1_78_0.tar.gz 
    ```

2. 编译

    ```bash 
    # 编译前准备
     sudo apt-get update
     sudo apt-get install build-essential g++ python3-dev autotools-dev libicu-dev libbz2-dev
   
    # 运行 bootstrap.sh 生成 b2
    ./bootstrap.sh --prefix=/usr/local
   
    # 运行 b2 生成 stage\lib
    ./b2 link=static runtime-link=static
    # 安装到 prefix /usr/local
    ./b2 install
    ```

## Win 10 构建编译

```bash
# 构建vs2022项目
# 32位
cmake -S . -B build -G "Visual Studio 17 2022" -A Win32
# 64位
cmake -S . -B build -G "Visual Studio 17 2022" -A x64

# 编译生成库文件
cmake --build build --config Release --clean-first
```

## Debian 12 构建编译

```bash
# 64位
cmake -S . -B build

# 编译生成库文件
cmake --build build --config Release --clean-first
```
