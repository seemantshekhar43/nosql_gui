import 'dart:io';
import 'api-response.dart';
import 'http_exception.dart';
import 'api_endpoints.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  final String _userIDStorageKey = 'USER_ID';
  final String _authTokenStorageKey = 'AUTH_TOKEN';
  final String _libraryStorageKey = 'LIBRARY_ID';
  final String _currentBranchStorageKey = 'BRANCH_ID';
  final String _baseUrl = 'ee35-117-251-215-235.in.ngrok.io';

//   static String _authToken;
//   static String _libraryID;
//   static String _currentBranchID;
//   static String _userID;
//
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
//   static ApiHelper _instance;
//   factory ApiHelper() => _instance ?? ApiHelper._internal();
//   ApiHelper._internal();
//
//   Future<String> _getAuthToken() async {
//     if (_authToken != null) return _authToken;
//
//     final SharedPreferences prefs = await _prefs;
//     _authToken = prefs.getString(_authTokenStorageKey) ?? '';
//     return _authToken;
//   }
//
//   Future<void> _setAuthToken(String token) async {
//     final SharedPreferences prefs = await _prefs;
//     _authToken = token;
//     prefs.setString(_authTokenStorageKey, token);
//   }
//
//   String getAuth() {
//     return _authToken;
//   }
//
//   String getURL() {
//     return _baseUrl;
//   }
//
//   String getUID() {
//     return _userID;
//   }
//
//   Future<void> _setUID(String uID) async {
//     final SharedPreferences prefs = await _prefs;
//     _userID = uID;
//     //print('called: $_userID');
//     prefs.setString(_userIDStorageKey, uID);
//   }
//
//   String getLibraryID() {
//     return _libraryID;
//   }
//
//   Future<void> setLibraryID(String libraryID) async {
//     final SharedPreferences prefs = await _prefs;
//     _libraryID = libraryID;
//     prefs.setString(_libraryStorageKey, libraryID);
//   }
//
//   String getCurrentBranchID() {
//     return _currentBranchID;
//   }
//
//   Future<void> setCurrentBranchID(String branchID) async {
//     final SharedPreferences prefs = await _prefs;
//     _currentBranchID = branchID;
//     prefs.setString(_currentBranchStorageKey, branchID);
//   }
//
//   //Authentication
//
//   Future<bool> isLoggedIn() async {
//     final SharedPreferences prefs = await _prefs;
//     final token = prefs.getString(_authTokenStorageKey) ?? '';
//
//     if (token.isNotEmpty) {
//       _authToken = token;
//       _userID = prefs.getString(_userIDStorageKey) ?? '';
//       _libraryID = prefs.getString(_libraryStorageKey) ?? '';
//       _currentBranchID = prefs.getString(_currentBranchStorageKey) ?? '';
//     }
//     return token.isNotEmpty;
//   }
//
//   Future<void> logIn(Map data) async {
//     var responseBody = json.decode('{"data": "", "status": "NOK"}');
//
//     try {
// //      final url = '$_baseUrl$eLogIn';
//       final uri = Uri.http(_baseUrl, eLogIn);
//       print(uri);
//       final response = await http.post(uri, body: data);
//
//       if (response.statusCode == 200) {
//         //print('200 ran');
//         responseBody = jsonDecode(response.body);
//         //print(responseBody);
//         await _setAuthToken(responseBody['key']);
//         await _setUID(responseBody['user'].toString());
//         //print('uID is: $_userID');
//       } else {
//         Map<String, dynamic> data = jsonDecode(response.body);
//
//         String error = 'Error occurred';
//         data.keys.forEach((String key) {
//           if (key.contains('error')) {
//             error = data[key][0];
//             print(error);
//           }
//         });
//         throw HttpException(message: error);
//       }
//     } on SocketException catch (error) {
//       throw HttpException(message: 'No Internet Connection');
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   Future<void> logOut() async {
//     final SharedPreferences prefs = await _prefs;
//     prefs.clear();
//     _userID = null;
//     _authToken = null;
//     _libraryID = null;
//     _currentBranchID = null;
//   }
//
  //GET
  Future<ApiResponse> getRequest(
      {required String endpoint, required Map<String, String> query}) async {
    // if (_authToken.isEmpty || _authToken == null) {
    //   print('not logged in');
    //   return ApiResponse(error: true, errorMessage: 'User not logged in');
    // }
    try {
      //final url = '$_baseUrl$endpoint';
      final uri = Uri.http(_baseUrl, endpoint, query);
      print(uri);
      final response = await http.get(
        uri,
        headers: {
          HttpHeaders.accessControlAllowOriginHeader: '*',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
      );

      if (response.statusCode == 200) {

        return ApiResponse(data: jsonDecode(response.body));
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        String error = 'Error occurred';
        data.keys.forEach((String key) {
          if (key.contains('error')) {
            error = data[key][0];
            print(error);
          }
        });
        return ApiResponse(error: true, errorMessage: error);
      }
    } on SocketException catch (error) {
      throw HttpException(message: 'No Internet Connection');
    } catch (e) {
      throw e;
    }
  }

//   //POST
//   Future<ApiResponse> postRequest(
//       String endpoint, Map<String, dynamic> data) async {
//     if (_authToken.isEmpty || _authToken == null) {
//       return ApiResponse(error: true, errorMessage: 'User not logged in');
//     }
//     try {
// //      final url = '$_baseUrl$endpoint';
//       final uri = Uri.http(_baseUrl, endpoint);
//
//       final response = await http.post(uri,
//           headers: {
//             HttpHeaders.authorizationHeader: 'Token $_authToken',
//           },
//           body: data);
// //      print('code is ${response.statusCode}');
//       if (response.statusCode == 200) {
//         return ApiResponse(data: jsonDecode(response.body));
//       } else {
//         print(response.body);
//         Map<String, dynamic> data = jsonDecode(response.body);
//         String error = 'Error occurred';
//         data.keys.forEach((String key) {
//           if (key.contains('error')) {
//             error = data[key][0];
//             print(error);
//           }
//         });
//         return ApiResponse(error: true, errorMessage: error);
//       }
//     } on SocketException catch (error) {
//       throw HttpException(message: 'No Internet Connection');
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   //PATCH
//   Future<ApiResponse> patchRequest({String endpoint, var data, File file, String fileFieldName}) async {
//     if (_authToken.isEmpty || _authToken == null) {
//       return ApiResponse(error: true, errorMessage: 'User not logged in');
//     }
//     try {
//       http.Response response;
//       final uri = Uri.http(_baseUrl, endpoint);
//       print(uri);
//
//       // multipart that takes file
//       if(file!= null){
//         Map<String, String> headers = {
//           HttpHeaders.authorizationHeader: 'Token $_authToken',
//
//         };
//         var request = new http.MultipartRequest("PATCH", uri);
//         http.MultipartFile multipartFile =
//         await http.MultipartFile.fromPath('image', file.path);
//         request.files.add(multipartFile);
//         request.headers.addAll(headers);
//
//         data.forEach((key, value) {
//           request.fields[key] = value;
//           print(request.fields.toString());
//         });
//         final streamedResponse = await request.send();
//          response = await http.Response.fromStream(streamedResponse);
//         // add file to multipart
//       }
//       else{
//         Map<String, String> headers = {
//           HttpHeaders.authorizationHeader: 'Token $_authToken',
//         };
//         response = await http.patch(uri, headers: headers, body: data);
//       }
// //      print('code is ${response.statusCode}');
//       if (response.statusCode == 200) {
//         print('response is: ${jsonDecode(response.body)}');
//         return ApiResponse(data: jsonDecode(response.body));
//       } else {
//         print('error occurred: ${response.body}');
//         Map<String, dynamic> data = jsonDecode(response.body);
//         String error = 'Error occurred';
//         data.keys.forEach((String key) {
//           if (key.contains('error')) {
//             error = data[key][0];
//             print(error);
//           }
//         });
//         return ApiResponse(error: true, errorMessage: error);
//       }
//     } on SocketException catch (error) {
//       throw HttpException(message: 'No Internet Connection');
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   //DELETE
//   Future<ApiResponse> deleteRequest(
//       {String endpoint, Map<String, String> query}) async {
//     if (_authToken.isEmpty || _authToken == null) {
//       print('not logged in');
//       return ApiResponse(error: true, errorMessage: 'User not logged in');
//     }
//     try {
//       //final url = '$_baseUrl$endpoint';
//       final uri = Uri.http(_baseUrl, endpoint, query);
//       print(uri);
//       final response = await http.delete(
//         uri,
//         headers: {
//           HttpHeaders.authorizationHeader: 'Token $_authToken',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         if(response.body!= null)
//         return ApiResponse(data: jsonDecode(response.body));
//         return ApiResponse(data: 'Success Code 2000');
//       } else {
//         Map<String, dynamic> data = jsonDecode(response.body);
//         String error = 'Error occurred';
//         data.keys.forEach((String key) {
//           if (key.contains('error')) {
//             error = data[key][0];
//             print(error);
//           }
//         });
//         return ApiResponse(error: true, errorMessage: error);
//       }
//     } on SocketException catch (error) {
//       throw HttpException(message: 'No Internet Connection');
//     } catch (e) {
//       throw e;
//     }
//   }
}
