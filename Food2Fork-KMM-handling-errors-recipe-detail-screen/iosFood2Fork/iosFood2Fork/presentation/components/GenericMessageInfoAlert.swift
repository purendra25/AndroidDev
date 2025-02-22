import SwiftUI
import shared

struct GenericMessageInfoAlert  {
    
    func build(
        message: GenericMessageInfo,
        onRemoveHeadMessage: @escaping () -> Void
    ) -> Alert {
       return Alert(
            title: Text(message.title),
            message: Text(message.description_ ?? "Something went wrong"),
            primaryButton: .default(
                Text(message.positiveAction?.positiveBtnTxt ?? "Ok"),
                action: {
                    if(message.positiveAction != nil){
                        message.positiveAction!.onPositiveAction()
                    }
                    onRemoveHeadMessage()
                }
            ),
            secondaryButton: .default(
                Text(message.negativeAction?.negativeBtnTxt ?? "Cancel"),
                action: {
                    if(message.negativeAction != nil){
                        message.negativeAction!.onNegativeAction()
                    }
                    onRemoveHeadMessage()
                }
            )
        )
    }
}

