import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upload_medtadata_firebase/core/view_models/home/home_view_model.dart';
import 'package:upload_medtadata_firebase/ui/widgets/divider_widget.dart';
import 'package:upload_medtadata_firebase/ui/widgets/empty_list_widget.dart';
import 'package:upload_medtadata_firebase/ui/widgets/file_data_list_item.dart';
import 'package:upload_medtadata_firebase/ui/widgets/waiting_widget.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
    Future.microtask(
          () => context.read<HomeViewModel>().fetchMetadataFilesList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel provider = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload/Show Metadata Files"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                provider.pickFile();
              },
              child: const Text("Pick File")),
          provider.getIsPickedFile
              ? ElevatedButton(
              onPressed: () async {
                provider.uploadAndShowDialog(context);
              },
              child: const Text("upload File data"))
              : Container(),
          provider.busy
              ? const WaitingWidget()
              : provider.getMetadataFilesList!.isEmpty
              ? const EmptyListWidget()
              : Expanded(
            child: RefreshIndicator(
              onRefresh: provider.fetchMetadataFilesList,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                const DividerWidget(),
                shrinkWrap: true,
                itemCount: provider.getMetadataFilesList!.length,
                itemBuilder: (context, index) {
                  return FileDataListItem(
                      item: provider.getMetadataFilesList![index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
