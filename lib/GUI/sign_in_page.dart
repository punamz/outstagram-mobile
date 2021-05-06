import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool signInPage = true;

  void _toggleFormType() {
    setState(() {
      signInPage = !signInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildUsernameTextField() {
      return TextField(
        decoration: InputDecoration(
            hintText: 'Số điện thoại, email hoặc tên người dùng',
            hintStyle: TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder()),
        style: TextStyle(color: Colors.black),
        textInputAction: TextInputAction.next,
      );
    }

    Widget _buildPasswordTextField() {
      return TextField(
        decoration: InputDecoration(
            hintText: 'Mật khẩu',
            hintStyle: TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder()),
        obscureText: true,
        style: TextStyle(color: Colors.black),
        textInputAction: TextInputAction.done,
      );
    }

    Widget _buildLoginButton() {
      return Container(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            child: Text(
              "Đăng nhập",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onPressed: () {},
          ));
    }

    Widget _buildForgotPasswordBtn() {
      return InkWell(
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'bạn quên thông tin đăng nhập ư?',
                  style: TextStyle(fontSize: 14, color: Colors.black87)),
              TextSpan(
                  text: ' Hãy nhận trợ giúp đăng nhập ngay.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87)),
            ],
          ),
        ),
        onTap: () {
          print("1");
        },
      );
    }

    Widget _buildLoginWithFacebook() {
      return InkWell(
        child: Text(
          "Tiếp tục với facebook",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        onTap: () {
          print("sign in with facebook");
        },
      );
    }

    Widget _buildChangePageTypeBtn() {
      return InkWell(
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: signInPage
                      ? 'Bạn chưa có tài khoản?'
                      : "Bạn đã có tài khoản?",
                  style: TextStyle(fontSize: 13, color: Colors.black87)),
              TextSpan(
                  text: signInPage ? ' Hãy đăng ký.' : ' Hãy đăng nhập.',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
            ],
          ),
        ),
        onTap: _toggleFormType,
      );
    }

    Widget _buildSignUpBtn() {
      return  Container(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            child: Text(
              "Đăng kí bằng email hoặc số điện thoại",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onPressed: () {},
          ));
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(),
          Center(
            child: SingleChildScrollView(
              //physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(20, signInPage ? 0 : 300, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Outstagram',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: signInPage? 50:200),
                  if (signInPage) _buildUsernameTextField(),
                  if (signInPage) SizedBox(height: 10),
                  if (signInPage) _buildPasswordTextField(),
                  if (signInPage) SizedBox(height: 25),
                  if (signInPage) _buildLoginButton(),
                  if (signInPage) SizedBox(height: 25),
                  if (signInPage) _buildForgotPasswordBtn(),

                  if (!signInPage) _buildLoginWithFacebook(),
                  SizedBox(height: 25),
                  Row(children: <Widget>[
                    Expanded(child: Divider(color: Colors.black54)),
                    Text(
                      "HOẶC",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Expanded(child: Divider(color: Colors.black54)),
                  ]),
                  SizedBox(height: 25),
                  signInPage ? _buildLoginWithFacebook() : _buildSignUpBtn(),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            child: _buildChangePageTypeBtn(),
          ),
        ],
      ),
    );
  }
}
