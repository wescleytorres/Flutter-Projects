
      appBar: AppBar(
        title: Text('alo'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              var name = data[index]['name'];
              var email = data[index]['email'];
              var idade = data[index]['idade'];

              return Column(
                children: [
                  ListTile(
                    title: Text('Nome: $name'),
                    subtitle: Text('Email: $email'),
                    trailing: Text('Idade: $idade'),
                  ),
                  Divider(),
                ],
              );
            },
          ))
        ],
      ),
    
      List data;


