import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/Image_learn_202.dart';
import 'package:flutter_application_1/303/reqrest_recource/model/resource_model.dart';
import 'package:flutter_application_1/303/reqrest_recource/service/reqres_service.dart';
import 'package:flutter_application_1/303/reqrest_recource/viewModel/req_res_provider.dart';
import 'package:flutter_application_1/product/extension/string_extension.dart';
import 'package:flutter_application_1/product/global/resource_context.dart';
import 'package:flutter_application_1/product/global/theme_notifer.dart';
import 'package:flutter_application_1/product/service/project_dio.dart';
import 'package:provider/provider.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqresService(service)),
      builder: (context, child) {
        final reqResProvider = context.watch<ReqResProvider>();

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifer>().changeTheme();
            },
          ),
          appBar: AppBar(
            actions: [_SaveAndNavigate()],
            title: reqResProvider.isLoading ? const CircularProgressIndicator(color: Colors.white) : null,
          ),
          body: Column(
            children: [
              _TempPlaceholder(),
              Expanded(child: _resourceListView(context, context.watch<ReqResProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(color: Color(items[index].color?.colorValue ?? 0), child: Text(items[index].name ?? ''));
      },
    );
  }
}

class _SaveAndNavigate extends StatelessWidget {
  const _SaveAndNavigate();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<ReqResProvider>().saveToLocale(context.read<ResourceContext>());
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return ImageLearn202();
            },
          ),
        );
      },
      child: Icon(Icons.ac_unit),
    );
  }
}

class _TempPlaceholder extends StatelessWidget {
  const _TempPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Selector<ReqResProvider, bool>(
      builder: ((context, value, child) {
        return value ? const Placeholder() : const Text('data');
      }),
      selector: (context, provider) {
        return provider.isLoading;
      },
    );
  }
}
